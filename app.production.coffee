axis            = require 'axis'
rupture         = require 'rupture'
autoprefixer    = require 'autoprefixer-stylus'
less            = require 'less'
js_pipeline     = require 'js-pipeline'
commonjsify     = require 'commonjsify'
css_pipeline    = require 'css-pipeline'
browserify      = require 'roots-browserify'
roots_config    = require 'roots-config'
contentful      = require 'roots-contentful'
marked          = require 'marked'
slugify         = require 'slug'
ClientTemplates = require 'client-templates'

module.exports =
  ignores: ['bower.json','.bowerrc','.env','readme.md', '**/layout.*','**/layout-*.*', '**/_*', '.gitignore', 'ship.*conf','assets/components/**/*', 'views/_**/**/*']

  extensions: [
    contentful
      access_token:'xxxxxxxx'
      space_id: 'xxxxxxxx'
      content_types:
        retail_slider:
          id: 'xxxxxxxx'
        corporate_slider:
          id: 'xxxxxxxx'
        hospitality_slider:
          id: 'xxxxxxxx'
        glossar_items:
          id: 'xxxxxxxx'
          template: 'views/_glossar-item.jade'
          path: (entry) -> "glossar/#{slugify(entry.title)}"
    browserify
      files: ["assets/js/main.coffee"]
      out: "js/build.js"
      sourceMap: false
      minify: true
    roots_config
      index:
        title: 'QSC Airqoo | Start'
        description: 'This is a Sample description'
        buttonText: 'Jetzt Kontakt aufnehmen'
        buttonLink: '#Kontakt'
      retail:
        title: 'QSC Airqoo | Retail'
        description: 'This is a Sample description'
        buttonText: 'Jetzt Kontakt aufnehmen'
        buttonLink: '#Kontakt'
      corporate:
        title: 'QSC Airqoo | Corporate'
        description: 'This is a Sample description'
        buttonText: 'Jetzt Kontakt aufnehmen'
        buttonLink: '#Kontakt'
      hospitality:
        title: 'QSC Airqoo | Hospitality'
        description: 'This is a Sample description'
        buttonText: 'Jetzt Kontakt aufnehmen'
        buttonLink: '#Kontakt'
      about:
        title: 'QSC Airqoo | About'
        description: 'This is a Sample description'
        buttonText: 'Entdecken Sie unsere Branchenlösungen'
        buttonLink: '/'
      glossar:
        title: 'QSC Airqoo | Glossar'
        description: 'This is a Sample description'
        buttonText: 'Entdecken Sie unsere Branchenlösungen'
        buttonLink: '/'
        data: contentful.glossar_items
      glossarItem:
        title: 'QSC Airqoo | #{entry.title}'
        description: 'This is a Sample description'
        buttonText: 'Entdecken Sie unsere Branchenlösungen'
        buttonLink: '/'
      news:
        title: 'QSC Airqoo | News'
        description: 'This is a Sample description'
        buttonText: 'Entdecken Sie unsere Branchenlösungen'
        buttonLink: '/'
        filterTag: 'airqoo'

    css_pipeline
      files: 'assets/css/*.less'
    js_pipeline
      files: ['assets/js/vendor/*.js','assets/js/vendor/*.coffee']
      out: 'js/vendor.js'
      minify: true
      sourceMap: false
  ]

  'coffee-script':
     sourcemap: false
     minify: true

  less:
     sourcemap: false

  jade:
     pretty: false

  locals:
    markdown: marked
    slug: slugify
    env: "development"
    contact:
        employees:[
           '10 - 49'
           '50 - 249'
           '250 - 499'
           '500 - 999'
           '1.000 - 1.999'
           '2.000 - 4.999'
           '5.000 - 9.999'
           '10.000 - 19.999'
           '20.000 - 49.999'
           '50.000 - 99.999'
           '> 100.000'
          ]
        locations:[
           '5 - 50'
           '51 - 100'
           '101 - 250'
           '> 250'
          ]
        area:[
           '< 1000'
           '1000 - 2500'
           '2501-10000'
           '2501-10000'
           '> 25000'
           ]
        industries:
          all:[
            'Autohäuser u. Tankstellen'
            'Baugewerbe, Grundstücks- u Wohnungswesen'
            'Dienstleistungen'
            'Erziehung und Unterricht'
            'Gastgewerbe'
            'Gesundheits- und Sozialwesen'
            'Handel'
            'Messe und Kongresse'
            'Öffentliche Verwaltung, Körperschaften'
            'Sportstätte'
            'Unterhaltung, Erholung u. Kunst'
            'Sonstiges'
          ]
          retail:[
            'Autohäuser u. Tankstellen'
            'Dienstleistungen'
            'Gastgewerbe'
            'Handel'
          ]
          corporate:[
            'Baugewerbe, Grundstücks- u Wohnungswesen'
            'Dienstleistungen'
            'Energie- u. Wasserversorgung, Umwelt'
            'Finanz- u. Versicherungsdienstleistungen'
            'Öffentliche Verwaltung, Körperschaften'
            'Verarbeitendes Gewerbe, Konsumgüter'
            'Sonstiges'
          ]
          hospitaltiy:[
            'Baugewerbe, Grundstücks- u Wohnungswesen'
            'Dienstleistungen'
            'Erziehung und Unterricht'
            'Gastgewerbe'
            'Gesundheits- und Sozialwesen'
            'Messe und Kongresse'
            'Öffentliche Verwaltung, Körperschaften'
            'Sportstätte'
            'Unterhaltung, Erholung u. Kunst'
            'Sonstiges'
          ]

  server:
    clean_urls: true
    error_page: "404.html"
    gzip : true

  output: 'production'
