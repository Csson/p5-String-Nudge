requires 'perl', '5.010000';

requires 'Sub::Exporter::Progressive';

on 'test' => sub {
	requires 'Syntax::Feature::Qi', '0.2002';
    requires 'Test::More', '0.96';
};
