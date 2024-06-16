import 'package:flutter/material.dart';
import 'package:teste_flutter/utils/study_session.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<StudySession> sessions = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  void addSession() {
    setState(() {
      sessions.add(StudySession(
        title: titleController.text,
        description: descriptionController.text,
        date: DateTime.now(),
        reviews: [],
      ));
      titleController.clear();
      descriptionController.clear();
    });
  }

  void addReview(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add Review',
            style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
          ),
          content: TextField(
            controller: reviewController,
            decoration: const InputDecoration(hintText: 'Enter your review'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  sessions[index].reviews.add(reviewController.text);
                  reviewController.clear();
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
              ),
            ),
          ],
        );
      },
    );
  }

  void removeSession(int index) {
    setState(() {
      sessions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 121, 169, 191),
        title: const Text(
          'Study Sessions',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: addSession,
                child: const Text(
                  'Add Session',
                  style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 5,
              color: Color.fromARGB(255, 121, 169, 191),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Study sessions done',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 121, 169, 191),
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  final session = sessions[index];
                  return Card(
                    color: const Color.fromARGB(255, 121, 169, 191),
                    child: ListTile(
                      title: Text(
                        session.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        session.description,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                              ),
                              onPressed: () => addReview(index),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: () => removeSession(index),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 121, 169, 191),
                              title: Text(
                                session.title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: session.reviews
                                    .map((review) => Text(
                                          review,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ))
                                    .toList(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
