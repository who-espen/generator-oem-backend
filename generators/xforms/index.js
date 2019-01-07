'use strict';

const Generator = require('yeoman-generator');

module.exports = class extends Generator {
  async prompting() {
    const answers = await this.prompt([
      {
        type: 'input',
        name: 'country',
        message: 'Please enter the name of the country',
        required: true
      },
      {
        type: 'input',
        name: 'eu',
        message: 'Please enter the evaluation unit name (3 chatacter)',
        required: true
      },
      {
        type: 'input',
        name: 'district',
        message: 'Please enter the disctrict name',
        required: true
      },
      {
        type: 'input',
        name: 'districtId',
        message: 'Please enter the disctrict ID',
        required: true
      }
    ]);

    this.country = answers.country;
    this.eu = answers.eu;
    this.district = answers.district;
    this.districtId = answers.districtId;
  }

  writing() {
    this.fs.copyTpl(this.templatePath('../../app/templates/**'), this.destinationPath(), {
      country: this.country,
      eu: this.eu,
      district: this.district,
      districtId: this.districtId
    });
  }
}
