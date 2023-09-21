import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() {
    // devuelveme todos los elementos de la clase enum
    return FilterType.all;
  }

  void setCurrentFilter(FilterType newFilter) {
    print(newFilter);
    state = newFilter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now(),
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now(),
      )
    ];
  }

  void createTodo(String description) {
    state = [
      // tomo una copia del estado actual y lo agrego al arreglo
      // por eso ... y coma con la nueva tarea
      ...state,
      Todo(
        id: uuid.v4(),
        description: description,
        completedAt: null,
      )
    ];
  }

  void toggleTodo(String id) {
    // barro los todo
    // le paso al id a la funcion
    // si el id es igual tomo la copia de la clase todo
    // por que las propiedades del original estan como final no asi las propiedades
    // de la copiam entonces si el completedAt esta en todo.done pasa a null
    // si no le mando la fecha a esa tarea
    state = state.map((todo) {
      if (todo.id == id) {
        todo = todo.copyWith(completedAt: todo.done ? null : DateTime.now());
      }

      // si no encuentro tarea retorno la tarea que paso por la condicion y no fue cambiada
      // osea que no fueron iguales el id con el id de tarea
      return todo;
    }).toList();
  }
}

@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref) {
  // dentro de otro provider siempre usar watch

  // trae el estado del filtro pending, all o completed
  final currentFiltered = ref.watch(todoCurrentFilterProvider);

  // traeme el estado de todas las tareas
  final todos = ref.watch(todosProvider);

// si el estado es all traelas todas 
// si el esstado es completed 
// si el estado pending traeme las pendientes

// llamo al provider en donde tenia las las tareas
  switch (currentFiltered) {
    case FilterType.all:
      return todos;
      break;
    case FilterType.completed:
      return todos.where((todo) => todo.done).toList();
      break;
    case FilterType.pending:
      return todos.where((todo) => !todo.done).toList();
      break;
  }
}

// cuando el provider es de solo lectura NO HAER CON CLASE
// USAR PROVIDER SIMPLE



