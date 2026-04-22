# Localization

## Loading translations

The program will try to find and load translations from the following directories:

  1. `translations` relative to current binary
  2. `$DATAROOTDIR/tuned-switcher/translations`
  3. `/usr/share/tuned-switcher/translations`

Starting with the first, the program will attempt to traverse all directories down to the last one. If a directory exists, it will be used for loading translations. If no directories exist, the function will be disabled.

## Working with translations

A special helper script `i18n_update.sh` must be used for all operations with translations to ensure consistency with other parts of the project.

In order to use this script, the Qt Linguist package must be installed.

## Updating translations

1. Rebase the existing translations to match the latest code changes:

```
cd assets/i18n/
./i18n_update.sh
```

2. Open the desired `*.ts` files and make changes using the Qt Linguist tool.

3. Run the `i18n_update.sh` helper script again:

```
./i18n_update.sh
```

## Adding a new translation

1. Change current working directory to `assets/i18n`:

```
cd assets/i18n/
```

2. Use the `lupdate-qt6` tool to generate a new translation for **en** (replace it with the desired two-letter lowercase ISO 639 language name; do not use the country name here):

```
lupdate-qt6 -locations relative ../../src/ -ts tuned-switcher_en.ts -no-obsolete
```

3. Open the generated `*.ts` file and make changes using the Qt Linguist tool.

4. Run the `i18n_update.sh` helper script:

```
./i18n_update.sh
```
