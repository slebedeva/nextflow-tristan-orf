FROM python:3.11-slim
# --no-cache-dir to reduce image size
RUN pip3 install --no-cache-dir torch torchvision --index-url https://download.pytorch.org/whl/cu126
RUN pip3 install --no-cache-dir transcript_transformer==v1.0.1
