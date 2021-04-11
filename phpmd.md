# PHP: Hypertext Preprocessor MessDetector

## CLI

### Installation

#### PEAR

```sh
pear channel-discover pear.pdepend.org
pear install pdepend/PHP_Depend-1.1.4
```

```sh
pear channel-discover pear.phpmd.org
pear install phpmd/PHP_PMD-1.5.0
```

#### PHPBrew

```sh
phpbrew -d app get --downloader=wget phpmd
```

### Verify

```sh
phpmd --version
```

### Tips

#### PhpStorm

Set path of `phpmd`:

1. File
2. Default Settings
3. Languages & Frameworks
4. Mess Detector

Check MessDetector validation:

1. File
2. Default Settings
3. Editor
4. Inspections
5. PHP MessDetector validation
