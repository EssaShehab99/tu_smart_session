import 'package:flutter/material.dart';
import '/data/network/data_response.dart';
import '/data/utils/extension.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/text_field_widget.dart';
import '/data/models/question.dart';
import '/data/providers/ask_cody_provider.dart';
import '/views/shared/loading_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import 'package:provider/provider.dart';

class AskCodyScreen extends StatefulWidget {
  const AskCodyScreen({Key? key}) : super(key: key);

  @override
  State<AskCodyScreen> createState() => _AskCodyScreenState();
}

class _AskCodyScreenState extends State<AskCodyScreen> {
  late TextEditingController _messageController;
  ScrollController? _scrollController;
  late FocusNode focusNode;
  List<int>? questionsId;
  List<String>? command;
  String? hintText = "";
  int count = 0;
  @override
  void initState() {
    focusNode = FocusNode();
    _scrollController = ScrollController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AskCodyProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedComponents.appBar("Digital Wallet"),
          Expanded(
            child: FutureBuilder(
                future: provider.getQuestions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget();
                  } else if (snapshot.data != null && snapshot.hasData) {
                    return Selector<AskCodyProvider, List<Questions>>(
                      selector: (_, p) => p.questions,
                      builder: (context, value, _) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollController?.jumpTo(
                              _scrollController!.position.maxScrollExtent);
                        });
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: value.length,
                                controller: _scrollController,
                                padding:
                                    const EdgeInsets.all(SharedValues.padding),
                                itemBuilder: (context, index) =>
                                    _buildChatText(value[index]),
                              ),
                            ),
                            Selector<AskCodyProvider, bool>(
                              selector: (_, p) => p.isReadOnly,
                              builder: (context, value, _) => Container(
                                height: 80,
                                alignment: Alignment.bottomCenter,
                                padding:
                                    const EdgeInsets.all(SharedValues.padding),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                child: TextFieldWidget(
                                  controller: _messageController,
                                  focusNode: focusNode,
                                  readOnly: value,
                                  keyboardType: TextInputType.number,
                                  hintText: hintText,
                                  onChanged: (value) {},
                                  suffixIcon: SizedBox(
                                    width: 10,
                                    height: 50,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: ButtonWidget(
                                        withBorder: false,
                                        onPressed: () async {
                                          if (hintText ==
                                              "Please enter subject ID") {
                                            Result result =
                                                await provider.getSubject(
                                                    _messageController.text);
                                            if (result is Success) {
                                              _messageController.text = "";
                                              count++;
                                              hintText = command?.get(count);
                                              provider.changeReadOnly(false);
                                              focusNode.requestFocus();
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              SharedComponents.showSnackBar(
                                                  context,
                                                  "This subject not found !!");
                                            }
                                          } else if (hintText ==
                                              "Please enter section ID") {
                                            SharedComponents.showOverlayLoading(
                                                context, () async{
                                              if ((await provider.getSection(
                                                      _messageController.text))
                                                  is Success) {
                                                Result result = await provider
                                                    .checkSectionTime();
                                                if (result is Success) {
                                                  // ignore: use_build_context_synchronously
                                                  SharedComponents.showSnackBar(
                                                      context, "Subject added");
                                                } else if (result is Error) {
                                                  // ignore: use_build_context_synchronously
                                                  SharedComponents.showSnackBar(
                                                      context,
                                                      "${result.exception}");
                                                }
                                              }
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.send,
                                          size: 25,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return ErrorWidget("");
                  }
                }),
          )
        ],
      ),
    ));
  }

  Align _buildChatText(Questions question) {
    final provider = Provider.of<AskCodyProvider>(context, listen: false);
    return Align(
      alignment: question.myMessage
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Builder(
          builder: (context) => InkWell(
                borderRadius:
                    BorderRadius.circular(SharedValues.borderRadius * 0.5),
                onTap: () async {
                  if (question.type?.contains("clickable") == true) {
                    await Future.delayed(const Duration(milliseconds: 125));
                    provider.addQuestions(Questions(
                      id: question.id,
                      group: 3,
                      question: question.question,
                      myMessage: true,
                      isDisplay: true,
                    ));
                    await Future.delayed(const Duration(milliseconds: 250));
                    provider.addQuestions(Questions(
                      id: question.id,
                      group: 3,
                      question: question.answer ?? "",
                      myMessage: false,
                      isDisplay: true,
                    ));
                  } else if (question.type?.contains("interactive") == true) {
                    questionsId = question.type
                        ?.split(":")
                        .get(1)
                        ?.split(",")
                        .map((e) => int.parse(e))
                        .toList();
                    if (questionsId != null && questionsId!.isNotEmpty) {
                      await Future.delayed(const Duration(milliseconds: 250));
                      provider.addQuestions(Questions(
                        id: question.id,
                        group: 3,
                        question: question.question ?? "",
                        myMessage: true,
                        isDisplay: true,
                      ));
                      await Future.delayed(const Duration(milliseconds: 250));
                      provider.repeatQuestions(questionsId!);
                    }
                  } else if (question.type?.contains("dependent") == true) {
                    command = question.type?.split(":").get(1)?.split(",");
                    if (command != null && command!.isNotEmpty) {
                      hintText = command?.get(count);
                      await Future.delayed(const Duration(milliseconds: 250));
                      provider.changeReadOnly(!provider.isReadOnly);
                      focusNode.requestFocus();
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(SharedValues.padding * 0.5),
                  padding: const EdgeInsets.all(SharedValues.padding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          SharedValues.borderRadius * 0.5),
                      color: () {
                        if (question.myMessage) {
                          return Theme.of(context).primaryColor;
                        } else {
                          if (question.group == 1) {
                            return Theme.of(context).dividerColor;
                          } else if (question.group == 2) {
                            return Theme.of(context).dividerColor;
                          }
                        }
                      }()),
                  child: Text(question.question,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: question.myMessage
                              ? Theme.of(context).colorScheme.onPrimary
                              : null)),
                ),
              )),
    );
  }
}
