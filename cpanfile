requires 'perl', '5.008005';

requires 'App::cpanminus';
requires 'Carton::CLI';
requires 'Module::CPANfile';
requires 'Module::Metadata';

on test => sub {
    requires 'Test::More', '0.96';
};
