README

## Запуск локальной версии документации

_Чтобы локально развернуть копию документации:_

1. Установите Ruby.

   Windows -- скачайте и установите [Ruby+Devkit](https://rubyinstaller.org/downloads/).

   Ubuntu -- выполните следующие команды:

    ```shell
    sudo apt-get install ruby ruby-dev build-essential

    echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
    echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
    echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
    ```

   Mac OS -- Ruby поставляется в комплекте с ОС, устанавливать не требуется.

2. Установите Jekyll и Bundler:

   ```shell
   gem install jekyll bundler
   ```

3. Склонируйте репозиторий -- https://github.com/evotor/documentation-v2.git.
4. В командной строке, перейдите в папку репозитория.

   В Ubuntu для этого используйте команду `cd documentation-v2/`.

5. Установите необходимые зависимости, с помощью команды:

   ```shell
   bundle install
   ```

   На этом этапе могут возникнуть проблемы с установкой гема nokogiri. Тут вы найдёте их решение: [Ubuntu (см. раздел nokigiri в ответе)](https://stackoverflow.com/questions/16028028/nokogiri-will-not-install-error-failed-to-build-gem-native-extension), [MacOS](https://stackoverflow.com/questions/33996523/error-installing-nokogiri-failed-to-build-gem-native-extension-libiconv-is-mi).

6. Запустите Jekyll, с помощью команды:

   ```shell
   bundle exec jekyll service
   ```

   Локальная версия документации будет доступна по адресу `http://localhost:4000/`.

## Описание репозитория и структуры документации

В ветке `master` находится версия документации, развёрнутая на продуктовом сервере.  Собирается автоматически при merge ветки develop.

В ветке `develop` находится рабочая версия документации, развёрнутая на локальном сервере для тестирования. Собирается автоматически при push-е.

В ветке `documentation-new-theme`.

В папке `_data` находятся файлы бокового содержания разделов и верхней навигационной панели оформленные в `.yml` файлах. Имена файлов соответствуют разделам.
Для добавления элемента бокового меню требуется указать путь к файлу, который задаётся в теге `permalink`, в соответствующем .md-файле (об этом ниже).

В папке `_docs` и соответствующих подпапках находятся .md-файлы документации.

## Оформление новой страницы

Чтобы jekyll создал новую html-страницу, каждый .md-файл должен начинаться с frontmatter.

Пример:

```markdown
---
title: <Заголовок страницы>
permalink: <Постоянный путь страницы>
sidebar: <Имя файла бокового меню, которое будет отображаться на странице>
tags: <Список тегов>
product: <Продукт, например, REST API>
---

СОДЕРЖИМОЕ ФАЙЛА
```

Тег `permalink` задаёт постоянную ссылку на страницу. Эту же ссылку требуется добавлять в соответствующий файл бокового содержания в папке `_data`.

Ссылки на страницы имеют следующий вид:

```
<продукт>_<имя>_<.md-файла>.html
```

Пример:

```
rest_push_notifications.html
```

Для проверки отображения, нет необходимости добавлять файл в боковое содержание. После сохранения .md-файла jekyll создаст соотствующую html-страницу, которая будет доступна по адресу:

    http://localhost:4000/<продукт>_<имя>_<.md-файла>.html
