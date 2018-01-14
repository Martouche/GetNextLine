Test ( get_next_line, read_line, .init = open_file, .fini = close_file)
{
	char *expected = "Confidence is so overrated .";
	char *got = get_next_line(fd);
	cr_assert_str_eq(got, expected);
}
