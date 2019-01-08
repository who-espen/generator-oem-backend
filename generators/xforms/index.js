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
        name: 'eu',
        message: 'Please enter the evaluation unit name (3 chatacter)'
      },
      {
        type: 'input',
        name: 'xformVersion',
        message: 'Please enter the verion of the xform package',
        default: 4
      },
      {
        type: 'input',
        name: 'district',
        message: 'Please enter the disctrict name'
      },
      {
        type: 'input',
        name: 'districtId',
        message: 'Please enter the disctrict ID'
      }
    ]);

    this.country = answers.country;
    this.eu = answers.eu;
    this.xformVersion = answers.xformVersion;
    this.district = answers.district;
    this.districtId = answers.districtId;
  }

  writing() {
    this.fs.copyTpl(this.templatePath('../../app/templates/xforms/**'), this.destinationPath(), {
      country: this.country,
      eu: this.eu,
      xformVersion: this.xformVersion,
      district: this.district,
      districtId: this.districtId
    });
  }
}
