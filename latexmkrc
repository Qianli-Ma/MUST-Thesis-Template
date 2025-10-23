# template/latexmkrc

use strict;
use warnings;
use File::Basename 'dirname';
use File::Spec;
use Cwd 'abs_path';
use Config;

# Path separator (':' on *nix, ';' on Windows)
my $PSEP = $Config{path_sep};

# Directory where THIS rc file lives
my $tpl_rc_dir = abs_path( dirname(__FILE__) );
my $tpl_def    = File::Spec->catdir($tpl_rc_dir, '.def');

# Helper to prepend to env search paths safely
sub add_path {
  my ($env, @paths) = @_;
  my $cur = $ENV{$env} // '';
  my @cur = $cur eq '' ? () : split(/\Q$PSEP\E/, $cur);
  # Prepend our paths so project overrides (if any) can still come first
  my @new = (@paths, @cur);
  $ENV{$env} = join($PSEP, @new);
}

# Make the template discoverable (recursively where helpful)
add_path('TEXINPUTS',
  File::Spec->catdir($tpl_def, '.sty') . '//',        # recursive search of .sty
  $tpl_def . '//',                                    # recursive .def
  File::Spec->catdir($tpl_def, '.resource') . '//',   # recursive .resource
  ''                                                  # allow kpathsea to search system TEXMF
);
add_path('BSTINPUTS', File::Spec->catdir($tpl_def, '.sty') . '//', ''); # include system BST paths
add_path('BIBINPUTS', '.');  # project-local .bib

# Declare globals for strict
our ($latex, $pdflatex, $lualatex, $bibtex, $pdf_mode, $bibtex_use, $clean_ext, $out_dir);


# Engines & flags (can be overridden by project rc)
$latex    //= 'xelatex -interaction=nonstopmode -halt-on-error -synctex=1 %O %S';
# $pdflatex = $latex;
$pdflatex = 'xelatex -interaction=nonstopmode -halt-on-error -synctex=1 %O %S';  # force xelatex for PDF mode

$lualatex //= 'lualatex -interaction=nonstopmode -halt-on-error -synctex=1 %O %S';
$bibtex   //= 'bibtex %O %S';

# Build mode and defaults
$pdf_mode = 1;
$bibtex_use //= 2;     # run bibtex in $out_dir
$clean_ext  .= ' %R.synctex.gz';

# If the project didn't choose an engine explicitly, default to XeLaTeX
$latex = $latex;  # no-op; here just to show precedence

# Allow projects to set $out_dir; if not set, give a sane default
$out_dir //= 'build/%R';

# Optional: a friendly banner so you know the template rc was loaded
print ">>> Using template rc at $tpl_rc_dir\n";
# Diagnostic: print search-path envs
print "DEBUG: TEXINPUTS=$ENV{TEXINPUTS}\n";
print "DEBUG: BSTINPUTS=$ENV{BSTINPUTS}\n";
print "DEBUG: BIBINPUTS=$ENV{BIBINPUTS}\n";
