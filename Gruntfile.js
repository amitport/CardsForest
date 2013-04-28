'use strict';
var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;

exports = module.exports = function(grunt) {
  
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-livereload');
  grunt.loadNpmTasks('grunt-regarde');
  
  grunt.initConfig({
    //(source/sass -> generated/css)
    compass: {
     generate: {
       options: {
         raw:  'http_path = "/";' +
               'http_images_path = "/images";' +
               'http_stylesheets_path = "/css";' +
               
               'css_dir = "generated/css";' +
               'sass_dir = "source/sass";' +
               'images_dir = "static/images"'
         }
     }
   },
   //compile all coffeescript files in dev/coffee directly to dev/js
   coffee: {
      compile: {
        options: {
            bare: true //do not wrap coffeescript files in their own function scope (everything is global -> bad but easier to develop)
        },
        files: [{
            expand: true,         // Enable dynamic expansion.
            cwd: 'source/coffee/',   // Src matches are relative to this path.
            src: ['**/*.coffee'], // Actual pattern(s) to match.
            dest: 'generated/scripts/',      // Destination path prefix.
            ext: '.js',           // Dest filepaths will have this extension.
        }]
      }
    },
    //run a small server
    connect: {
      server: {
        options: {
          port: 9000,
          hostname: '0.0.0.0', //change to 0.0.0.0 for LAN access
          //append HTML with a script that enables live reload 
          middleware: function (connect, options) {
            return [
              lrSnippet,
              connect.static('App'),
              connect.static('generated')
            ];
          }
        }
      }
    },
    
    //watch for change on our file system
    regarde: {
      compass: {
        files: ['source/sass/**/*'],
        tasks: ['compass']
      },
      coffee: {
        files: ['source/coffee/**/*'],
        tasks: ['coffee']
      },
      livereload: {
        files: ['App/**/*','generated/**/*'],
        tasks: ['livereload']
      }
    }
  });
  
  grunt.registerTask('default', ['compass', 'coffee', 'livereload-start', 'connect:server', 'regarde']);
};
