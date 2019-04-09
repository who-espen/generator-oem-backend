'use strict';

const Generator = require('yeoman-generator');

module.exports = class extends Generator {
  async prompting() {
    const answers = await this.prompt([
      {
        type: 'input',
        name: 'country',
        message: 'Please enter the name of the country'
      },
      {
        type: 'input',
        name: 'xformVersion',
        message: 'Please enter the verion of the xform package',
        default: 4
      }
    ]);

    this.country = answers.country;
    this.eu = answers.eu;
    this.xformVersion = answers.xformVersion;
  }

  writing() {
    this.fs.copyTpl(this.templatePath('../../app/templates/views/**'), this.destinationPath(), {
      country: this.country,
      eu: this.eu,
      xformVersion: this.xformVersion
    });
  }
}




