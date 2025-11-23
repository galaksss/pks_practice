<h1>Отчет по 1 практической работе</h1>
<h2><em>Подготовил Наротнев Георгий, группа ЭФБО-06-23</em></h2>



<h3>Скриншот вывода flutter doctor</h3>


<img width="2089" height="1079" alt="image" src="https://github.com/user-attachments/assets/52ff8fe6-dbca-486e-82a1-426d4989169f" />



<h3>Скриншот списка устройств, вызванный командой flutter devices</h3>


<img width="2358" height="503" alt="image" src="https://github.com/user-attachments/assets/a198abe7-a42f-4be1-aab1-2c2577c8f93d" />



<h3>Скриншот первого приложения hello_flutter</h3>


<img width="903" height="1524" alt="image_2025-11-14_18-06-17" src="https://github.com/user-attachments/assets/5d979701-a39b-42d5-a4ee-d77b59819d01" />



<h3>Скриншоты успешной сборки apk</h3>

<img width="1327" height="199" alt="image_2025-11-14_18-20-18" src="https://github.com/user-attachments/assets/defc4285-b2a9-4d0b-815d-c1771165b133" />
<img width="572" height="756" alt="image_2025-11-14_18-20-39" src="https://github.com/user-attachments/assets/a6ca188a-d1c4-4a15-a001-43b5babd761d" />



  <p>Используемая операционная система: Windows 11</p>
  <p>Используемый терминал: PowerShell</p>


<h3>Возникшие проблемы и их решение</h3>


Пробел в пути к Android SDK.
Изначально SDK стоял в C:\Users\VIVOBOOK S\AppData\Local\Android\Sdk, из-за пробела flutter doctor выдавал предупреждение.
Решение: перенёс SDK в C:\Android\Sdk, указал новый путь в Android Studio и командой: flutter config --android-sdk "C:\Android\Sdk"

Ошибка с Android SDK Build-Tools 35.0.0 при flutter run
Проект требовал конкретную версию build-tools 35.0.0.
Решение: через SDK Manager -> SDK Tools (Show Package Details) установил Android SDK Build-Tools 35.0.0, далее flutter clean и повторный flutter run.


<h3>Вывод</h3>

В ходе практики была полностью настроена среда разработки Flutter под Windows: установлен Flutter SDK, Android SDK и эмулятор, подключен VS Code, проверена работа команд flutter doctor и flutter devices. Создан и успешно запущен тестовый проект hello_flutter на Android-эмуляторе, отработаны механизмы hot reload и hot restart. Среда готова для работы.
