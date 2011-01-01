/*-
 * Copyright (c) 2006,2010 Joseph Koshy
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * $Id$
 */

include(`elfts.m4')

#include <libelf.h>

#include "tet_api.h"

/*
 * Test the `elf_errmsg' entry point.
 */

/*
 * Assertion: the function returns NULL if the argument is zero and
 * there is no pending error in the library.
 */
void
tcZeroNoerror(void)
{

	TP_ANNOUNCE("returns NULL with zero & no current error");

	(void) elf_errno();	/* discard current error number */

	if (elf_errmsg(0) == NULL)
		tet_result(TET_PASS);
	else
		tet_result(TET_FAIL);
}

/*
 * An error value of -1 should return non-NULL
 */

void
tcMinusoneNoerror(void)
{
	const char *msg;

	TP_ANNOUNCE("returns non-null for arg -1 & no current error");

	(void) elf_errno();	/* discard stored error */

	msg = elf_errmsg(-1);
	if (msg == NULL)
		tet_result(TET_FAIL);

	tet_result(TET_PASS);
}
