import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_iti/core/utilities/styles_manager.dart';
import 'package:final_project_iti/core/utilities/app_colors.dart';
import 'package:final_project_iti/l10n/app_localizations.dart';

class ManageUserQuestionsView extends StatefulWidget {
  const ManageUserQuestionsView({super.key});

  @override
  State<ManageUserQuestionsView> createState() =>
      _ManageUserQuestionsViewState();
}

class _ManageUserQuestionsViewState extends State<ManageUserQuestionsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.manageUserQuestions ?? 'Manage User Questions',
          style: AppTextStyles.textStyleMedium20,
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: loc.pendingQuestions ?? 'Pending Questions'),
            Tab(text: loc.answeredQuestions ?? 'Answered Questions'),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _QuestionsList(pending: true),
          _QuestionsList(pending: false),
        ],
      ),
    );
  }
}

class _QuestionsList extends StatelessWidget {
  final bool pending;
  const _QuestionsList({required this.pending});

  @override
  Widget build(BuildContext context) {
    final query = FirebaseFirestore.instance
        .collection('askedQuestions')
        .where('answer', isNull: pending)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: query,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: \\${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No questions found'));
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            final title = data['title'] ?? '';
            final description = data['description'] ?? '';
            final answer = data['answer'];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(title, style: AppTextStyles.textStyleMedium16),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(description),
                    if (!pending && answer != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Answer: \\${answer}',
                        style: AppTextStyles.textStyleRegular14,
                      ),
                    ],
                  ],
                ),
                onTap: pending
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AnswerQuestionView(
                              docId: docs[index].id,
                              title: title,
                              description: description,
                            ),
                          ),
                        );
                      }
                    : null,
              ),
            );
          },
        );
      },
    );
  }
}

class AnswerQuestionView extends StatefulWidget {
  final String docId;
  final String title;
  final String description;
  const AnswerQuestionView({
    required this.docId,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<AnswerQuestionView> createState() => _AnswerQuestionViewState();
}

class _AnswerQuestionViewState extends State<AnswerQuestionView> {
  final TextEditingController _answerController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitAnswer() async {
    if (_answerController.text.trim().isEmpty) return;
    setState(() => _isLoading = true);
    try {
      await FirebaseFirestore.instance
          .collection('askedQuestions')
          .doc(widget.docId)
          .update({
            'answer': _answerController.text.trim(),
            'status': 'answered',
          });
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.answerSubmittedSuccessfully ??
                  'Answer submitted successfully',
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error submitting answer')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.answerQuestion ?? 'Answer Question',
          style: AppTextStyles.textStyleMedium20,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: AppTextStyles.textStyleMedium16),
            const SizedBox(height: 8),
            Text(widget.description),
            const SizedBox(height: 24),
            TextFormField(
              controller: _answerController,
              decoration: InputDecoration(
                hintText: loc.answerHint ?? 'Enter your answer',
                filled: true,
                fillColor: AppColors.lightSearchFillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.lightUnfocusedTextFieldBorder,
                  ),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submitAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColorStart,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        loc.submitAnswer ?? 'Submit Answer',
                        style: AppTextStyles.textStyleMedium16.copyWith(
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
