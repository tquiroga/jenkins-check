jenkins-check
=============

If you have read my blog article about [Using Jenkins for Symfony2 Project](http://blog.lazycloud.net/en/using-jenkins-for-a-symfony2-project/)
Here is a bash script to check the output before your Jenkins.

Installation
-------

Be sure to make the script executable:
```bash
chmod +x check.sh
```

Usage
-------

```bash
./check {lint|phploc|pdepend|phpmd|phpmd-ci|phpcs|phpcs-ci|phpcpd|phpdoc|phpunit|phpcb|all}
```

* **lint**: Executes PHP lint to look for PHP syntax errors
* **phploc**: Display metrics about the code (lines of code, number of functions, classes, etc)
* **pdepend**: Measure the quality of a design in terms of its extensibility, reusability, and maintainability
* **phpmd**: MessDetector detects non optimized and unused code, bugs, etc
* **phpcs**: CodeSniffer check that standards are respected (PSR0,PSR1, Symfony2 standards as well)
* **phpcpd**: CopyPasteDetector look for code redundancies
* **phpdoc**: PHPDocumentor generates Code Documentation
* **phpunit**: PHPUnit executes test suites
* **phpcb**: Code Browser generates HTML code browser of your code
* **all**: Executes all the previous commands

- *phpmd-ci/phpcs-ci* : Same as *phpmd/phpcs* but generates all xml reports