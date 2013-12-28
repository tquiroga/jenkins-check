#!/bin/bash

#Clean and prepare
rm -Rf app/build/api app/build/code-browser app/build/coverage app/build/logs app/build/pdepend app/build/docs/*
mkdir app/build/api app/build/code-browser app/build/coverage app/build/logs app/build/pdepend

case "$1" in
        lint)
			php -l .
			php -l src/*
			;;
        phploc)
            phploc --log-csv app/build/logs/phploc.csv src/
            ;;
        pdepend)
			pdepend --jdepend-xml=app/build/logs/jdepend.xml --jdepend-chart=app/build/pdepend/dependencies.svg --overview-pyramid=app/build/pdepend/overview-pyramid.svg src
            ;;
        phpmd)
			phpmd src text app/phpmd.xml
			;;
		phpmd-ci)
			phpmd src xml app/phpmd.xml --reportfile app/build/logs/pmd.xml
			;;
        phpcs)
			phpcs --standard=Symfony2 src | more
			;;
		phpcs-ci)
			phpcs --report=checkstyle --report-file=app/build/logs/checkstyle.xml --standard=Symfony2 src
			;;
		phpcpd)
			phpcpd --log-pmd app/build/logs/pmd-cpd.xml src
			;;
		phpdoc)
			phpdoc -d 'src' -t 'app/build/docs' --title='My Project'
			;;
		phpunit)
			phpunit -c app/phpunit.xml
			;;
		phpcb)
			phpcb --log app/build/logs --source src --output app/build/code-browser
			;;
		all)
			php -l .
			php -l src/*
            phploc --log-csv app/build/logs/phploc.csv src/
			pdepend --jdepend-xml=app/build/logs/jdepend.xml --jdepend-chart=app/build/pdepend/dependencies.svg --overview-pyramid=app/build/pdepend/overview-pyramid.svg src
			phpmd src text app/phpmd.xml
			phpmd src xml app/phpmd.xml --reportfile app/build/logs/pmd.xml
			phpcs --standard=Symfony2 src | more
			phpcs --report=checkstyle --report-file=app/build/logs/checkstyle.xml --standard=Symfony2 src
			phpcpd --log-pmd app/build/logs/pmd-cpd.xml src
			phpdoc -d 'src' -t 'app/build/docs' --title='My Project'
			phpunit -c app/phpunit.xml
			phpcb --log app/build/logs --source src --output app/build/code-browser
			;;
        *)
            echo $"Usage: ./check {lint|phploc|pdepend|phpmd|phpmd-ci|phpcs|phpcs-ci|phpcpd|phpdoc|phpunit|phpcb|all}"
            echo " all: Launch all of them"
            exit 1
esac
