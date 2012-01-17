cmake_minimum_required(VERSION 2.6)
project(mini-projet_deux)

file(
	GLOB_RECURSE
	source_files
	../src/*
	)

add_executable(
	../bin/mini-projet_deux
	${source_files}
	)
set(CMAKE_CXX_FLAGS "-g -Wall -pedantic -Wextra")
