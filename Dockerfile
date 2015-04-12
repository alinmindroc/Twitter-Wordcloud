FROM python:2.7.9
ADD tagcloud_files /tagcloud_files
WORKDIR /tagcloud_files
RUN pip install -r requirements.txt
