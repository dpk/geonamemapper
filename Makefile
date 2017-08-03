.PHONY: all fetch clean

### Phony Targets
all: fetch

fetch: data/cities1000.txt data/alternateNames.txt

clean:
	rm -rf data

### Real Targets

data:
	mkdir data

data/cities1000.zip: | data
	curl -# -o $@ http://download.geonames.org/export/dump/cities1000.zip
data/cities1000.txt: data/cities1000.zip
	unzip data/cities1000.zip -d data
	touch $@

data/alternateNames.zip: | data
	curl -# -o $@ http://download.geonames.org/export/dump/alternateNames.zip

data/alternateNames.txt: data/alternateNames.zip
	unzip data/alternateNames.zip -d data
	touch $@
