FROM python:2.7.9
ADD wordcloud_files /wordcloud_files
WORKDIR /wordcloud_files
RUN pip install -r requirements.txt
