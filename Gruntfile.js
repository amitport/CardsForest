'use strict';
var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;

exports = module.exports = function(grunt) {
  
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-livereload');
  grunt.loadNpmTasks('grunt-regarde');
  
  grunt.initConfig({
    //compile sources/compass -> generated/css
    compass: {
     generate: {
       options: {
         raw:  'http_path = "/";' +
               'http_images_path = "/images";' +
               'http_stylesheets_path = "/css";' +
               
               'css_dir = "generated/css";' +
               'sass_dir = "sources/compass";' +
               'images_dir = "static/images"'
         }
     }
   },
   //compile sources/coffee -> generated/js
   coffee: {
      compile: {
        options: {
            bare: true 
        },
        files: [{
          expand: true,         // Enable dynamic expansion.
          cwd: 'sources/coffee/',   // Src matches are relative to this path.
          src: ['**/*.coffee'], // Actual pattern(s) to match.
          dest: 'generated/js/',      // Destination path prefix.
          ext: '.js',           // Dest filepaths will have this extension.
        }]
      }
    },
    //run a development server
    connect: {
      server: {
        options: {
          port: 9000,
          hostname: '0.0.0.0', //change to 0.0.0.0 for LAN access
          middleware: function (connect, options) {
            return [
              //append HTML with a script that enables live reload 
              lrSnippet,
              //mount static, generated and external_components to host home
              connect.static('static'),
              connect.static('generated'),
              connect.static('experiments'),
              connect.static('external_components/bower'),
              connect.static('external_components/other')
            ];               
          }
        }
      }
    },
    
    //watch for changes in the file system
    regarde: {
      compass: {
        files: ['sources/compass/**/*'],
        tasks: ['compass']
      },
      coffee: {
        files: ['sources/coffee/**/*'],
        tasks: ['coffee']
      },
      livereload: {
        files: ['static/**/*', 'generated/**/*', 'experiments/**/*'],
        tasks: ['livereload']
      }
    }
  });
  
  grunt.registerTask('build', ['compass', 'coffee']);
  grunt.registerTask('default', ['compass', 'coffee', 'livereload-start', 'connect:server', 'regarde']);
};
