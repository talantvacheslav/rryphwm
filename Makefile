# rryphwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c rryphwm.c util.c
OBJ = ${SRC:.c=.o}

all: rryphwm

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

rryphwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f rryphwm ${OBJ} rryphwm-${VERSION}.tar.gz

dist: clean
	mkdir -p rryphwm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		rryphwm.1 drw.h util.h ${SRC} dwm.png transient.c rryphwm-${VERSION}
	tar -cf rryphwm-${VERSION}.tar rryphwm-${VERSION}
	gzip rryphwm-${VERSION}.tar
	rm -rf rryphwm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f rryphwm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/rryphwm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < rryphwm.1 > ${DESTDIR}${MANPREFIX}/man1/rryphwm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/rryphwm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/rryphwm\
		${DESTDIR}${MANPREFIX}/man1/rryphwm.1

.PHONY: all clean dist install uninstall
