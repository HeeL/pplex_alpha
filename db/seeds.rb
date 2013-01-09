langs = ['ActionScript', 'Clojure', 'Ada', 'Assembly', 'C', 'C#', 'C++', 'Cobol', 'ColdFusion', 'D', 'Delphi', 'Erlang', 'Forth', 'Fortran', 'Haskell', 'Java', 'JavaScript', 'Lisp', 'Lua', 'Objective C', 'OCaml', 'PHP', 'Pascal', 'Perl', 'Python', 'Rexx', 'Ruby', 'Scala', 'SQL', 'Scheme', 'Shell', 'Smalltalk', 'Tcl', 'Visual Basic']
cms = ['ExpressionEngine','Radiant CMS', 'WordPress', 'Joomla', 'ModX', 'TextPattern', 'RefineryCMS', 'Drupal', 'Concrete5', 'DotNetNuke', 'Umbraco', 'TinyCMS']
frameworks = ['Ruby on Rails', 'Sinatra', 'Zend', 'CakePHP', 'Yii', 'Symfony', 'CodeIgniter', 'Kohana', 'ASP.NET', 'Flask', 'Django', 'Spring', 'Compojure', 'Express', 'Turbine', 'Pylons', 'Tornado', 'SproutCore', 'Conjure', 'Picard']
dbs = ['Cassandra', 'CouchDB', 'MongoDB', 'Redis', 'Memcached', 'DB2', 'MySQL', 'Oracle', 'PostgreSQL', 'SQLite', 'SQL Server', 'Sybase']
others = ['jQuery', 'Ext JS', 'CSS', 'HTML', 'Node.js']
techs = langs + cms + frameworks + dbs + others

Language.create(techs.uniq.map{|lang| {name: lang}})

