cmake_minimum_required(VERSION 2.6)
project(trois)

file(
	GLOB_RECURSE
	source_files
	../src/*
	)

add_executable(
	../bin/trois
	${source_files}
	)
