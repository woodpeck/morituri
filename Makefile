
# base plugin
BASE_HEADER=plugins/base_plugin.hpp

# plugins
DUMMY_SOURCE=plugins/dummy/dummy_plugin.cpp
DUMMY_HEADER=plugins/dummy/dummy_plugin.hpp

NAVTEQ_SOURCE=plugins/navteq/navteq_plugin.cpp
NAVTEQ_HEADER=plugins/navteq/navteq_plugin.hpp\
		plugins/navteq/navteq.hpp\
		plugins/navteq/navteq2osm_tag_parser.hpp\
		plugins/navteq/navteq_mappings.hpp\
		plugins/comm2osm_exceptions.hpp\
		plugins/util.hpp\
		plugins/readers.hpp

# sources of all plugins
SOURCE=comm2osm.cpp\
		${NAVTEQ_SOURCE}\
		${DUMMY_SOURCE}

# header of all plugins
HEADER=${BASE_HEADER}\
		${NAVTEQ_HEADER}\
		${DUMMY_HEADER}

# test sources and headers
TEST_SOURCE=tests/navteq/test_navteq2osm.cpp
TEST_HEADER=${NAVTEQ_HEADER}


# includes
OSMIUM_INCLUDE=-I${HOME}/libs/libosmium-latest/include
INCLUDES=${OSMIUM_INCLUDE} -Iplugins
LIBS=-lbz2 -lgdal -lexpat -lgeos -lpthread -lz -losmpbf -lprotobuf-lite -lboost_system -lboost_filesystem


all: comm2osm tests/navteq_test
.PHONY: all

comm2osm: ${SOURCE} ${HEADER} 
	g++ -std=c++11 -o comm2osm ${SOURCE} ${INCLUDES} ${LIBS}

tests/navteq_test: ${TEST_SOURCE} ${TEST_HEADER} 
	g++ -std=c++11 -o tests/navteq_test ${TEST_SOURCE} ${INCLUDES} ${LIBS}

doc: ${SOURCE} ${HEADER} Doxyfile
	doxygen Doxyfile
   
clean: 
	rm -f comm2osm test testfiles
	rm -rf .tmp_navteq
	rm -rf doc
