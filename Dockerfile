FROM python:3-slim@sha256:d7a925f9eb9639a93e455b9f12c167569358818c0f62b51b88edbc8fcf34c421 # 3-slim

LABEL "maintainer"="Ammar Askar <ammar@ammaraskar.com>"

# Needed to invoke the Sphinx Makefile.
RUN apt-get -y update && apt-get -y install make

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]