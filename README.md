# miniCounter

A compact counter app.

### UI

![Promo image](assets/github/promo.jpg?raw=true)

Both iOS and Android has it's own UI with __miniCounter__.
For iOS we use Cupertino widgets and [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines),
while for Android we use Material widgets and [Material Design Guidelines](https://m3.material.io).

You can switch to both design with triple-tap on the "Counter" title on the main page of the app.

### History

Currently, each update on each counter is stores into another database.
This is works because of the triggers, see `lib/data/database/tables.drift` file.

We not use and not show this history currently, just store it for possible updates.