# MessDetector

## Installation

### PEAR

```sh
pear channel-discover pear.pdepend.org
pear install pdepend/PHP_Depend-1.1.4
```

```sh
pear channel-discover pear.phpmd.org
pear install phpmd/PHP_PMD-1.5.0
```

### PHPBrew

```sh
phpbrew -d app get --downloader=wget phpmd
```

## Verify

```sh
phpmd --version
```

## Configuration

### PhpStorm

Set path of `phpcs`:

1. File
2. Default Settings
3. Languages & Frameworks
4. Mess Detector

Check Code Sniffer validation:

1. File
2. Default Settings
3. Editor
4. Inspections
5. PHP Mess Detector validation
