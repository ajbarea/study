# `java.util` Data Structures Cheatsheet

## 1. **List Interface**  

- **`ArrayList<E>`**: Resizable array implementation of the `List` interface.
  - `add(E e)`: Adds element to the list.
  - `get(int index)`: Retrieves element at index.
  - `set(int index, E element)`: Replaces element at specified index.
  - `remove(int index)`: Removes element at index.
  - `size()`: Returns the number of elements.

- **`LinkedList<E>`**: Doubly-linked list implementation of `List` and `Deque`.
  - `addFirst(E e)`, `addLast(E e)`: Adds element at beginning/end.
  - `removeFirst()`, `removeLast()`: Removes element from beginning/end.
  - Supports all methods from `List`.

## 2. **Set Interface**  

- **`HashSet<E>`**: Implements a set based on a hash table (no guarantees of iteration order).
  - `add(E e)`: Adds element if it is not already present.
  - `remove(Object o)`: Removes specified element.
  - `contains(Object o)`: Returns `true` if the element exists.

- **`LinkedHashSet<E>`**: Hash table with predictable iteration order (insertion order).
- **`TreeSet<E>`**: Navigable set implementation based on a Red-Black tree (sorted order).

## 3. **Map Interface**  

- **`HashMap<K, V>`**: Hash table-based implementation of `Map` (no ordering).
  - `put(K key, V value)`: Adds key-value pair.
  - `get(Object key)`: Returns value for given key.
  - `remove(Object key)`: Removes mapping for the key.
  - `containsKey(Object key)`, `containsValue(Object value)`: Checks existence.
  - `keySet()`, `values()`: Returns `Set` view of keys or `Collection` of values.

- **`LinkedHashMap<K, V>`**: Maintains insertion order or access-order.
- **`TreeMap<K, V>`**: Navigable map based on Red-Black tree (sorted keys).

## 4. **Queue Interface**  

- **`PriorityQueue<E>`**: A priority heap-based queue (natural ordering or provided comparator).
  - `add(E e)`, `offer(E e)`: Adds element.
  - `poll()`: Retrieves and removes head (smallest element).
  - `peek()`: Retrieves head without removing.

- **`ArrayDeque<E>`**: Resizable array implementation of `Deque`.
  - `addFirst(E e)`, `addLast(E e)`: Adds elements to front/end.
  - `removeFirst()`, `removeLast()`: Removes elements from front/end.
  - `peekFirst()`, `peekLast()`: Views elements at front/end.

## 5. **Stack (Legacy)**  

- **`Stack<E>`** (extends `Vector`): LIFO stack.
  - `push(E e)`: Pushes element onto stack.
  - `pop()`: Removes and returns top element.
  - `peek()`: Returns top element without removing.

## 6. **Utility Classes**  

- **`Collections`**: Utility class with static methods for collection manipulation.
  - `sort(List<T> list)`: Sorts the list.
  - `reverse(List<?> list)`: Reverses the list.
  - `max(Collection<? extends T> coll)`, `min(...)`: Finds maximum/minimum element.

## Tips

- **Generics**: Use `<E>`, `<K, V>` for generic types in collections.
- **Thread-Safe Alternatives**: `Collections.synchronizedList()`, `ConcurrentHashMap` for concurrent access.