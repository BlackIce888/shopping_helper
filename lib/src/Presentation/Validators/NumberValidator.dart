/*
 * Copyright (c) 2019.
 * Andreas Diesendorf <andiesendorf@gmail.com>
 */

class NumberValidator {

    static Function(int) intRequired() {
        return (value) {
            if (value == null) {
                return 'Input is empty';
            }
        };
    }
}
