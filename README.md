
## Introduction
the easiest way you can add a template for your project
you can customize the template as you wish

## Getting Started

1. Install Mason

```shell
dart pub global activate mason_cli

```

2. Add mason to your project

```shell
mkdir mason
cd mason
mason init
```
## generate file that contains assets variables and widgets and feature:

add bricks to mason.yaml file so you can access the files that I have share on Github


```shell
bricks:
  readme:
    git:
      url: git@github.com:neop-planet/app-base-code.git
      path: bricks/readme
  assets:
    git:
      url: git@github.com:neop-planet/app-base-code.git
      path: bricks/assets
  project_template:
    git:
      url: git@github.com:neop-planet/app-base-code.git
      path: bricks/project_template
  feature:
    git:
      url: git@github.com:neop-planet/app-base-code.git
      path: bricks/feature
  auth:
    git:
      url: git@github.com:neop-planet/app-base-code.git
      path: bricks/auth

```
## to get the dependecy that you applied
```shell
mason get
```
## Dependencies

Below is a list of default dependencies used in this project:
```yaml
dependencies:
  dio: ^5.2.0
  pretty_dio_logger:
  cached_network_image: ^3.2.3
  shimmer: ^3.0.0
  flutter_svg: ^2.0.7
  easy_localization: ^3.0.2
  smooth_page_indicator: ^1.1.0
  bloc: ^8.1.2
  flutter_bloc: ^8.1.3
  carousel_slider: ^5.0.0
  animated_widgets_flutter: ^1.1.1+2
  get_it: ^8.0.2
  lottie: ^3.1.3
  fluttertoast: ^8.1.2
  # hive: ^2.2.3
  # hive_flutter: ^1.1.0
  flutter_smart_dialog: ^4.8.2
  bot_toast: ^4.0.3
  pinput: ^5.0.0
  animate_do:
  permission_handler:
  image_picker: ^1.0.7
  device_info_plus: ^11.1.0
  cupertino_icons: ^1.0.6
  flutter_screenutil: ^5.9.3
  shared_preferences: ^2.3.2
```
### generate assets folder:
```shell
mason make assets -o ../
```


## generate project template:
```shell
mason make project_templete -o .././lib
```

## add new feature with the name you give:
```shell
mason make feature -o .././lib/features
```
## add the default authentications and splash:
```shell
mason make auth -o .././lib/features
```

```
## Add assets paths in pubspec.yaml file
```yaml
  assets:
    - assets/images/
    - assets/json/
    - assets/fonts/
    - assets/icons/
    - assets/translations/

```

## generate file that contains assets variables and fonts and json:

1. activate flutter gen

```shell
dart pub global activate flutter_gen
```


2. add these dependencies to dev_dependencies

```yaml
dev_dependencies:
  build_runner:
  flutter_gen_runner:
  injectable_generator: 
```

3. add flutter gen configs to pubspec.yaml

```yaml
flutter_gen:
  output: lib/core/resources/
  line_length: 80 

  # Optional
  integrations:
    flutter_svg: true
    flare_flutter: true
    rive: true
    lottie: true
```

generate assets folder:



mason make assets -o ../

mason make project_templete -o .././lib

mason make auth -o .././lib/features

mason make feature -o .././lib/features


flutter pub run build_runner build

flutter pub run easy_localization:generate -S "assets/translations" -O "lib/core/app_strings" -o "locale_keys.dart" -f keys