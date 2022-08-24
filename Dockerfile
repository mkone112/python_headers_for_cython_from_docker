FROM python:3.10


RUN groupadd --system django && useradd --system --create-home -g django django
#RUN chown django:django /app
USER django

COPY . /app
WORKDIR /app

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PATH="/home/django/.local/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "manage.py", "runserver"]