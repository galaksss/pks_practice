<h1>Отчет по 3 практической работе</h1>
<h2><em>Подготовил Наротнев Георгий, группа ЭФБО-06-23</em></h2>

<h3>Скриншот работающего приложения с текстом, кнопкой и контейнером</h3>
<img width="887" height="1525" alt="image_2025-11-18_03-32-05" src="https://github.com/user-attachments/assets/e8e2463d-d5dc-4cd6-9a68-6c996ee4bb3f" />


<h3>Скриншот с изменёнными цветами и стилями текста</h3>
<img width="918" height="1523" alt="image_2025-11-18_03-58-58" src="https://github.com/user-attachments/assets/f33af605-b799-49d2-90f2-b4c4da9143e5" />


<h3>Используемые виджеты</h3>

<p>В приложении были использованы следующие виджеты Flutter:</p>
<ul>
  <li><strong>MaterialApp</strong> – корневое приложение, задал название и тему.</li>
  <li><strong>Scaffold</strong> – базовый каркас экрана.</li>
  <li><strong>AppBar</strong> – верхняя панель с заголовком «Практика 3».</li>
  <li><strong>Column</strong> – вертикальная компоновка всех элементов в <code>body</code>.</li>
  <li><strong>Padding</strong> – отступы по краям экрана.</li>
  <li><strong>Text</strong> – заголовок и описательный текст.</li>
  <li><strong>ElevatedButton</strong> – кнопка «Добавить задачу».</li>
  <li><strong>Container</strong> – прямоугольная область для демонстрации цвета и размеров.</li>
  <li><strong>Row</strong> – горизонтальное размещение двух иконок.</li>
  <li><strong>Icon</strong> – иконки галочки и будильника.</li>
  <li><strong>SizedBox</strong> – зазоры между элементами по вертикали.</li>
</ul>

<h3>Изменение стилей и цветов</h3>

<ul>
  <li>Для текста использовался <code>TextStyle</code>:
    изменял <code>fontSize</code>, <code>fontWeight</code>, <code>color</code>, задавал выравнивание <code>textAlign</code>.
  </li>
  <li>Цвета задавались:
    стандартные цвета (<code>Colors.deepPurple</code>, <code>Colors.grey</code>, <code>Colors.green</code>, <code>Colors.orange</code>, <code>Colors.indigo</code>),
    а также кастомный цвет в <code>Container</code> через <code>Color(0xFFBBDEFB)</code>.
  </li>
  <li>Для кнопки <code>ElevatedButton</code> применял <code>ElevatedButton.styleFrom</code>:
    <code>backgroundColor</code>, <code>foregroundColor</code>, <code>padding</code>, <code>textStyle</code>.
  </li>
  <li>В <code>Container</code> использовал <code>BoxDecoration</code>:
    свойство <code>color</code> и <code>borderRadius.circular(16)</code> для закруглённых углов.
  </li>
  <li>В <code>ThemeData</code> указал базовый цвет темы (через <code>primarySwatch</code> / <code>colorScheme</code>).</li>
</ul>

<h3>Возникшие трудности</h3>

<ul>
  <li>Сначала казалось, что приложение не запускается, но оказалось, что в эмуляторе просто был выключен экран телефона, и нужно было его разблокировать как настоящий смартфон.</li>
  <li>Ранее при настройке Flutter и Android SDK были сложности с путём к SDK и версиями Build-Tools, приходилось разбираться с <code>flutter doctor</code> и устанавливать недостающие компоненты через Android Studio.</li>
  <li>При верстке экрана не сразу получилось подобрать удобные размеры шрифтов, высоту контейнера и отступы, поэтому несколько раз пересобирал приложение, пока интерфейс не стал выглядеть аккуратно.</li>
</ul>
