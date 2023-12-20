import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_flutter_onebox/presentation/state/task_state.dart';

void main() {
  group('TaskState', () {
    late TaskState taskState;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      taskState = TaskState();
      await taskState.loadTasks();
    });

    test('loadTasks should load saved tasks', () async {
      expect(taskState.tasks, isEmpty);

      await taskState.addTask('Task 1');
      await taskState.addTask('Task 2');
      await taskState.loadTasks();

      expect(taskState.tasks, ['Task 1', 'Task 2']);
    });

    test('addTask should add a task', () async {
      expect(taskState.tasks, isEmpty);

      await taskState.addTask('Task 1');
      await taskState.loadTasks();

      expect(taskState.tasks, ['Task 1']);
    });

    test('deleteTask should delete a task', () async {
      expect(taskState.tasks, isEmpty);

      await taskState.addTask('Task 1');
      await taskState.deleteTask('Task 1');
      await taskState.loadTasks();

      expect(taskState.tasks, isEmpty);
    });

    test('updateTask should update a task', () async {
      expect(taskState.tasks, isEmpty);

      await taskState.addTask('Task 1');
      await taskState.updateTask('Task 1', 'Task 2');
      await taskState.loadTasks();

      expect(taskState.tasks, ['Task 2']);
    });
  });
}
