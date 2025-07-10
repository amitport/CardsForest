'use strict';
var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;

exports = module.exports = function(grunt) {

  // Load grunt-contrib-sass plugin (compatible with grunt@0.4.5) and compass-mixins support.
  // Make sure to install these dependencies:
  //   npm install grunt-contrib-sass --save-dev
  //   npm install compass-mixins --save-dev
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-iced-coffee');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-livereload');
  grunt.loadNpmTasks('grunt-regarde');

  grunt.initConfig({
    // Compile sources/compass -> generated/css using grunt-contrib-sass with Compass enabled.
    sass: {
      compass: {
        options: {
          style: 'expanded',
          compass: true,
          // Load Compass mixins from node_modules.
          loadPath: ['node_modules/compass-mixins/lib']
        },
        files: [{
          expand: true,
          cwd: 'sources/compass',
          src: ['**/*.scss'],
          dest: 'generated/css',
          ext: '.css'
        }]
      }
    },

    // Compile sources/coffee -> generated/js.
    coffee: {
      compile: {
        options: {
          bare: true,
          runtime: "inline"
        },
        files: [{
          expand: true,
          cwd: 'sources/coffee/',
          src: ['**/*.coffee'],
          dest: 'generated/js/',
          ext: '.js'
        }]
      }
    },

    // Run a development server.
    connect: {
      server: {
        options: {
          port: 9000,
          hostname: '0.0.0.0', // change to 0.0.0.0 for LAN access
          middleware: function(connect, options) {
            return [
              lrSnippet,
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

    // Watch for changes in the file system.
    regarde: {
      sass: {
        files: ['sources/compass/**/*'],
        tasks: ['sass:compass']
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

  // Update tasks to use the new sass (Compass) configuration.
  grunt.registerTask('build', ['sass:compass', 'coffee']);
  grunt.registerTask('default', ['sass:compass', 'coffee', 'livereload-start', 'connect:server', 'regarde']);
};
