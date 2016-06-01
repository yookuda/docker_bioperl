FROM ubuntu:14.04
MAINTAINER yookuda <yookuda@nig.ac.jp>
ENV VERSION 1.6.923
RUN apt-get update && \
    apt-get install -y wget libexpat-dev cpanminus make libgd-dev libpng12-dev libjpeg-dev zlib1g-dev graphviz graphviz-dev libgraphviz-dev libssl-dev libdbd-mysql-perl libdbd-pg-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN cpanm Data::Stag IO::String Test::Most URI::Escape Algorithm::Munkres Array::Compare Clone Convert::Binary::C Error GD Graph GraphViz HTML::Entities HTML::HeadParser HTML::TableExtract HTTP::Request::Common LWP::UserAgent List::MoreUtils PostScript::TextBlock SOAP::Lite SVG SVG::Graph Set::Scalar Sort::Naturally Spreadsheet::ParseExcel XML::Parser XML::Parser::PerlSAX XML::SAX XML::SAX::Writer XML::Simple XML::Twig XML::Writer YAML DBI DBD::SQLite
RUN cd /tmp && \
    wget http://search.cpan.org/CPAN/authors/id/C/CJ/CJFIELDS/BioPerl-$VERSION.tar.gz && \
    tar xzvf BioPerl-$VERSION.tar.gz && \
    cd BioPerl-$VERSION && \
    perl Build.PL && \
    ./Build test && \
    ./Build install
RUN mkdir /data \
    mkdir /scripts
