# This file:
#   http://anggtwu.net/2021-1-C2-C3/Makefile.html
#   http://anggtwu.net/2021-1-C2-C3/Makefile
#          (find-angg "2021-1-C2-C3/Makefile")
# Author: Eduardo Ochs <eduardoochs@gmail.com>
#
# Created by hand from:
#   (find-angg "2021-1-C2-C3/README.org")
#   (find-fline "/tmp/.filest0.tex")
#   (setq last-kbd-macro (kbd "C-a C-q TAB lualatex SPC C-a <down>"))

all: compile_all_texs

compile_basic_texs:
	lualatex 2021-1-C2-MT1.tex
	lualatex 2021-1-C2-MT2.tex
	lualatex 2021-1-C2-P1.tex
	lualatex 2021-1-C2-P2.tex
	lualatex 2021-1-C2-contas-em-C2.tex
	lualatex 2021-1-C2-edovs.tex
	lualatex 2021-1-C2-int-subst.tex
	lualatex 2021-1-C2-intro.tex
	lualatex 2021-1-C2-os-dois-TFCs.tex
	lualatex 2021-1-C2-propriedades-da-integral.tex
	lualatex 2021-1-C2-somas-1-dicas.tex
	lualatex 2021-1-C2-somas-1.tex
	lualatex 2021-1-C2-somas-2-4.tex
	lualatex 2021-1-C2-somas-2.tex
	lualatex 2021-1-C2-subst.tex
	lualatex 2021-1-C3-MT1.tex
	lualatex 2021-1-C3-MT2.tex
	lualatex 2021-1-C3-P1.tex
	lualatex 2021-1-C3-P2.tex
	lualatex 2021-1-C3-abertos-e-fechados.tex
	lualatex 2021-1-C3-cortes.tex
	lualatex 2021-1-C3-curvas-de-nivel.tex
	lualatex 2021-1-C3-derivadas-parciais.tex
	lualatex 2021-1-C3-funcoes-quadraticas.tex
	lualatex 2021-1-C3-gradiente.tex
	lualatex 2021-1-C3-intro.tex
	lualatex 2021-1-C3-matriz-jacobiana.tex
	lualatex 2021-1-C3-notacao-de-fisicos.tex
	lualatex 2021-1-C3-planos.tex
	lualatex 2021-1-C3-taylor.tex
	lualatex 2021-1-C3-vetor-tangente.tex
	lualatex 2021-1-C3-visualizar-limites.tex

compile_all_texs:
	lualatex 2021-1-C2-MT1.tex
	lualatex 2021-1-C2-MT2.tex
	lualatex 2021-1-C2-P1.tex
	lualatex 2021-1-C2-P2.tex
	lualatex 2021-1-C2-contas-em-C2.tex
	lualatex 2021-1-C2-edovs.tex
	lualatex 2021-1-C2-int-subst.tex
	lualatex 2021-1-C2-intro.tex
	lualatex 2021-1-C2-os-dois-TFCs.tex
	lualatex 2021-1-C2-propriedades-da-integral.tex
	lualatex 2021-1-C2-somas-1-dicas.tex
	lualatex 2021-1-C2-somas-1.tex
	lualatex 2021-1-C2-somas-2-4.tex
	lualatex 2021-1-C2-somas-2.tex
	lualatex 2021-1-C2-subst.tex
	lualatex 2021-1-C3-MT1.tex
	lualatex 2021-1-C3-MT2.tex
	lualatex 2021-1-C3-P1.tex
	lualatex 2021-1-C3-P2.tex
	lualatex 2021-1-C3-abertos-e-fechados.tex
	lualatex 2021-1-C3-cortes.tex
	lualatex 2021-1-C3-curvas-de-nivel.tex
	lualatex 2021-1-C3-derivadas-parciais.tex
	lualatex 2021-1-C3-funcoes-quadraticas.tex
	lualatex 2021-1-C3-gradiente.tex
	lualatex 2021-1-C3-intro.tex
	lualatex 2021-1-C3-matriz-jacobiana.tex
	lualatex 2021-1-C3-notacao-de-fisicos.tex
	lualatex 2021-1-C3-planos.tex
	lualatex 2021-1-C3-taylor.tex
	lualatex 2021-1-C3-vetor-tangente.tex
	lualatex 2021-1-C3-visualizar-limites.tex
	lualatex 2021-1-C2-tudo.tex
	lualatex 2021-1-C3-tudo.tex
