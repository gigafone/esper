# Building Esper

The Maven command to install without GPG signing and without running tests is:

```sh
mvn -DskipTests -Dgpg.skip=true install
```

Run this at the root of the Esper project.

For more information, see also the [Building Esper][building] web page.

[building]: http://www.espertech.com/esper/building.php
