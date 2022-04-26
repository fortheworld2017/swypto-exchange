(function() {
  module.exports = {
    up: function(migration, DataTypes, done) {
      migration.addColumn('users', 'name', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'address1', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'address2', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'postcode', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'state', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'country', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'phone', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'skypeId', {
        type: DataTypes.STRING,
        allowNull: true
      });
      migration.addColumn('users', 'alternate_email', {
        type: DataTypes.STRING,
        allowNull: true
      });
      done();
    },
    down: function(migration, DataTypes, done) {
      migration.removeColumn('users', 'name');
      migration.removeColumn('users', 'address1');
      migration.removeColumn('users', 'address2');
      migration.removeColumn('users', 'postcode');
      migration.removeColumn('users', 'state');
      migration.removeColumn('users', 'country');
      migration.removeColumn('users', 'phone');
      migration.removeColumn('users', 'skypeId');
      migration.removeColumn('users', 'alternate_email');
    }
  };

}).call(this);
