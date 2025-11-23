<h1>Отчет по 4 практической работе</h1>
<h2><em>Подготовил Наротнев Георгий, группа ЭФБО-06-23</em></h2>

<h3>Скриншот работающего приложения с кнопками и счётчиком</h3>
<img width="902" height="1536" alt="image_2025-11-18_05-23-16" src="https://github.com/user-attachments/assets/8e7fd3f9-dd99-44f3-b0d3-59fbdbccf30a" />


<h3>Скриншот при значении счётчика &gt; 10</h3>
<img width="884" height="1526" alt="image_2025-11-18_05-23-16 (2)" src="https://github.com/user-attachments/assets/9b0af8bc-4a64-4bd9-bfb3-0e1ddead898f" />


<h3>Скриншот после сброса счётчика</h3>
<img width="891" height="1524" alt="image_2025-11-18_05-23-16 (3)" src="https://github.com/user-attachments/assets/831690af-f222-447c-a338-80452f397a9e" />


<h3>Используемые виджеты</h3>

<p>В приложении были использованы следующие виджеты Flutter:</p>
<ul>
  <li><strong>MaterialApp</strong> – корневая обёртка приложения.</li>
  <li><strong>Scaffold</strong> – базовый каркас экрана.</li>
  <li><strong>AppBar</strong> – верхняя панель с заголовком «Практика №4».</li>
  <li><strong>Padding</strong> – отступы вокруг основного содержимого.</li>
  <li><strong>Column</strong> – вертикальное расположение текста и кнопок.</li>
  <li><strong>Text</strong> – вывод строки вида «Значение счётчика: X».</li>
  <li><strong>ElevatedButton</strong> – кнопки «Увеличить» и «Сбросить».</li>
  <li><strong>Container</strong> – оформление кнопок (фон, скругление углов, внутренние отступы).</li>
  <li><strong>SizedBox</strong> – вертикальные промежутки между элементами.</li>
  <li><strong>StatefulWidget</strong> – экран <code>PracticeFourScreen</code> с состоянием в классе <code>_PracticeFourScreenState</code>.</li>
</ul>

<h3>Как реализовано обновление состояния</h3>

<p>В классе состояния <code>_PracticeFourScreenState</code> объявлена переменная:</p>

<pre><code>int counter = 0;
</code></pre>

<p>Для изменения значения счётчика реализованы три метода:</p>

<pre><code>void _increment() {
  setState(() {
    counter++;
  });
}

void _incrementByTen() {
  setState(() {
    counter += 10;
  });
}

void _reset() {
  setState(() {
    counter = 0;
  });
}
</code></pre>

<p>Во всех методах используются вызовы <code>setState(() { ... })</code>, чтобы Flutter перерисовал экран и обновил текст
«Значение счётчика: &lt;counter&gt;». Любое изменение переменной <code>counter</code> делается только внутри <code>setState</code>, поэтому интерфейс всегда показывает актуальное значение.</p>

<h3>Какие события обрабатывались</h3>

<p>В работе использовались обработчики событий у кнопок:</p>
<ul>
  <li>Для кнопки «Увеличить»:
    <ul>
      <li><code>onPressed: _increment</code> – обычное нажатие увеличивает счётчик на 1;</li>
      <li><code>onLongPress: _incrementByTen</code> – длительное нажатие увеличивает счётчик сразу на 10.</li>
    </ul>
  </li>
  <li>Для кнопки «Сбросить»:
    <ul>
      <li><code>onPressed: _reset</code> – сбрасывает значение счётчика в 0.</li>
    </ul>
  </li>
</ul>

<p>Таким образом, в практике были отработаны обработчики <code>onPressed</code> и <code>onLongPress</code> у <code>ElevatedButton</code> в связке с изменением состояния через <code>setState()</code>.</p>
