<h1>Отчет по 5 практической работе</h1>
<h2><em>Подготовил Наротнев Георгий, студент группы ЭФБО-06-23</em></h2>

<h3>Цели практической работы</h3>
<ul>
  <li>Закрепить работу со stateful-виджетами и списками в Flutter.</li>
  <li>Реализовать простое приложение заметок с добавлением, редактированием и удалением.</li>
  <li>Отработать навигацию между экранами и передачу данных через <code>Navigator</code>.</li>
  <li>Использовать виджеты <code>ListView.builder</code>, <code>Dismissible</code>, <code>TextField</code> для поиска.</li>
</ul>

<h3>Скриншоты</h3>

<h4>Главный экран со списком заметок и поиском</h4>
<img width="873" height="1534" alt="image_2025-11-18_20-58-28" src="https://github.com/user-attachments/assets/60ace8c3-e953-476f-9e92-b3bd1049dbc4" />


<h4>Экран создания новой заметки</h4>
<img width="878" height="1533" alt="image_2025-11-18_21-05-03" src="https://github.com/user-attachments/assets/58c90020-3617-4f89-85c5-513aa0e78ae9" />


<h4>Экран редактирования существующей заметки</h4>
<img width="901" height="1535" alt="image_2025-11-18_21-05-47" src="https://github.com/user-attachments/assets/7d632463-92ce-4f05-b910-5e9d456286f8" />


<h4>Удаление заметки (свайп или через иконку корзины)</h4>
<img width="933" height="1515" alt="image_2025-11-18_21-09-23" src="https://github.com/user-attachments/assets/20aec45c-2c2b-40c0-a6e6-582b0b1e8c2f" />
<img width="889" height="1534" alt="image_2025-11-18_21-10-41" src="https://github.com/user-attachments/assets/f6495366-35a6-47bc-95a2-c3a1c1e9332e" />

<h4>Поиск заметок по заголовку</h4>
<img width="894" height="1545" alt="image_2025-11-18_21-12-03" src="https://github.com/user-attachments/assets/bf40b141-34a4-4c4a-acfe-15f2d9e2d865" />


<h3>Используемые виджеты и навигация</h3>

<ul>
  <li><strong>MaterialApp</strong> – корневое приложение <code>SimpleNotesApp</code> с темой и домашним экраном.</li>
  <li><strong>StatefulWidget NotesPage</strong> – главный экран со списком заметок и полем поиска.</li>
  <li><strong>ListView.builder</strong> – вывод списка заметок по данным из <code>_filteredNotes</code>.</li>
  <li><strong>Dismissible</strong> – свайп-удаление заметки с красным фоном и иконкой корзины.</li>
  <li><strong>ListTile</strong> – отдельный пункт списка: заголовок, превью текста, иконка удаления.</li>
  <li><strong>FloatingActionButton</strong> – кнопка «+» для добавления новой заметки.</li>
  <li><strong>TextField</strong> в <strong>AppBar</strong> – поиск по заголовку заметки.</li>
  <li><strong>StatefulWidget EditNotePage</strong> – экран создания/редактирования с формой.</li>
  <li><strong>Form</strong> и <strong>TextFormField</strong> – поля ввода заголовка и текста заметки.</li>
  <li><strong>FilledButton.icon</strong> – кнопка «Сохранить» на экране редактирования.</li>
</ul>

<p>Навигация реализована через <code>Navigator.push</code> и <code>Navigator.pop</code>:</p>
<ul>
  <li>При нажатии на FAB вызывается <code>Navigator.push</code> c <code>EditNotePage()</code> для создания новой заметки.</li>
  <li>При тапе по заметке вызывается <code>Navigator.push</code> с <code>EditNotePage(existing: note)</code> для редактирования.</li>
  <li>После сохранения на экране редактирования выполнен <code>Navigator.pop(context, result)</code>, и обновлённая заметка возвращается на главный экран.</li>
</ul>

<h3>Основные фрагменты кода</h3>

<h4>1. Модель заметки</h4>
<pre><code>class Note {
  final String id;
  String title;
  String body;

  Note({
    required this.id,
    required this.title,
    required this.body,
  });

  Note copyWith({String? title, String? body}) {
    return Note(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
</code></pre>

<h4>2. Поиск по заголовку</h4>
<pre><code>String _searchQuery = '';

List&lt;Note&gt; get _filteredNotes {
  if (_searchQuery.isEmpty) return _notes;
  final q = _searchQuery.toLowerCase();
  return _notes
      .where((n) =&gt; n.title.toLowerCase().contains(q))
      .toList();
}
</code></pre>

<h4>3. Список заметок с Dismissible и переходом на редактирование</h4>
<pre><code>body: _filteredNotes.isEmpty
    ? const Center(child: Text('Пока нет заметок. Нажмите +'))
    : ListView.builder(
        itemCount: _filteredNotes.length,
        itemBuilder: (context, i) {
          final note = _filteredNotes[i];
          return Dismissible(
            key: ValueKey(note.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.redAccent,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) =&gt; _delete(note),
            child: ListTile(
              title: Text(
                note.title.isEmpty ? '(без названия)' : note.title,
              ),
              subtitle: Text(
                note.body,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () =&gt; _edit(note),
            ),
          );
        },
      ),
</code></pre>

<h4>4. Экран редактирования и сохранение заметки</h4>
<pre><code>void _save() {
  if (!_formKey.currentState!.validate()) return;
  _formKey.currentState!.save();

  final result = (widget.existing == null)
      ? Note(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: _title,
          body: _body,
        )
      : widget.existing!.copyWith(
          title: _title,
          body: _body,
        );

  Navigator.pop(context, result);
}
</code></pre>

<h3>Вывод</h3>
<p>
В ходе пятой практической работы было реализовано приложение <strong>Simple Notes</strong> с возможностью
создавать, редактировать, удалять заметки и искать их по заголовку. Я закрепил работу со
stateful-виджетами, динамическими списками и навигацией между экранами.
Наиболее сложной частью оказалось правильно организовать обмен данными между главным экраном
и экраном редактирования и не забывать вызывать <code>setState()</code> после изменения списка заметок.
Отдельно пришлось разобраться с настройками эмулятора и раскладкой клавиатуры, чтобы нормально вводить текст на русском языке.
</p>
