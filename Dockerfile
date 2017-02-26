FROM alpine
MAINTAINER ashushunov <ashushunov@mail.ru>

RUN apk update && apk add subversion
RUN mkdir -p /var/svn/ && svnadmin create /var/svn/repo

COPY ./svn-conf/* /var/svn/repo/conf/
COPY ./make-student-folders.sh /var/svn/
COPY ./student-list /var/svn/
RUN /var/svn/make-student-folders.sh

EXPOSE 3690
VOLUME /var/svn/repo

CMD [ "/usr/bin/svnserve", "-d", "--foreground", "--root", "/var/svn/repo" ]