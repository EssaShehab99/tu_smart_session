import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AskCodyProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedComponents.appBar("ASK Cody"),
          Expanded(
            child: FutureBuilder(
                future: provider.getQuestions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget();
                  } else if (snapshot.data != null && snapshot.hasData) {
                    return Consumer<AskCodyProvider>(
                      builder: (context, value, child) {
                        print("00000");
                        return ListView(
                        padding: const EdgeInsets.all(SharedValues.padding),
                        children: [
                          for (var item in provider.distincts)
                            if (item == 2)
                              Container(
                                padding: const EdgeInsets.all(
                                    SharedValues.padding * 0.5),
                                margin: const EdgeInsets.symmetric(
                                    vertical: SharedValues.padding * 0.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SharedValues.borderRadius),
                                    color: Theme.of(context).dividerColor),
                                child: Builder(builder: (context) {
                                  final list = provider.questions
                                      .where((element) => element.group == item)
                                      .toList();
                                  return ListView.builder(
                                    itemCount: list.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        _buildChatText(list[index]),
                                  );
                                }),
                              )
                            else
                              Builder(builder: (context) {
                                final list = provider.questions
                                    .where((element) => element.group == item)
                                    .toList();
                                return ListView.builder(
                                  itemCount: list.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      _buildChatText(list[index]),
                                );
                              })
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

  Align _buildChatText(Question question) {
    return Align(
      alignment: question.myMessage
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Builder(
          builder: (context) => Container(
                padding: const EdgeInsets.all(SharedValues.padding),
                margin: const EdgeInsets.symmetric(
                    vertical: SharedValues.padding * 0.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SharedValues.borderRadius * 0.5),
                    color: question.clickAble
                        ? Theme.of(context).primaryColor.withOpacity(0.3)
                        : question.myMessage
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).dividerColor),
                child: InkWell(
                  onTap: () async {
                    if (question.clickAble) {
                      final provider=Provider.of<AskCodyProvider>(context, listen: false);
                      await Future.delayed(const Duration(milliseconds: 125));
                      provider.addQuestions(
                          Question(
                              id: question.id,
                              group: 3,
                              question: question.question,
                              myMessage: true,
                              clickAble: false));
                      await Future.delayed(const Duration(milliseconds: 250));
                      provider.addQuestions(
                          Question(
                              id: question.id,
                              group: 3,
                              question: question.answer??"",
                              myMessage: false,
                              clickAble: false));
                    }
                  },
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
