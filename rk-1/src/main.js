let ostream = []

const DIV = 3;

const input = (from='input-area') => {
    input_area = document.getElementById(from);
    return input_area.value;
};

const print = (data, sep=' ', end='\n') => {
    if (data.constructor === Array) {
        ostream.push(data.join(sep) + end);
    } else {
        ostream.push(data + end);
    }
};

const flush = (to='output-area') => {
    output_area = document.getElementById(to);
    output_area.value = ostream.join('');
    ostream = [];
};

const clear = (target='output-area') => {
    output_area = document.getElementById(target);
    output_area.value = '';
};

const to_numbers = (data) => {
    let numbers = [];
    for (let i = 0; i < data.length; i++) {
        let converted_int = Number(data[i]);
        if (isNaN(converted_int)) {
            throw new TypeError('Sequence of numbers is expected!');
        } else {
            numbers.push(converted_int);
        }
    }

    return numbers;
}

const sum_multiple_nums = (numbers, div) => {
    let total = 0;
    
    for (let i = 0; i < numbers.length; i++) {
        if (numbers[i] % div == 0) {
            total += numbers[i];
        }
    }

    return total;
}

const main = () => {
    clear();

    try {
        let arr = input().split(/\s+/)
        is_empty = true;
        for (let i = 0; i < arr.length; i++) {
            if (arr[i] != '') {
                is_empty = false;
            }
        }
        if (is_empty) {
            throw new Error('Enter the numbers!');
        }
        let numbers = to_numbers(arr);

        let k = Number(input('k'));
        if (k >= numbers.length) {
            throw new Error(`Array must contain at least ${k + 1} numbers!`)
        }

        numbers[k] = sum_multiple_nums(numbers, DIV);
        print(numbers);
        flush();
    } catch (err) {
        console.log(err.message);
        alert(err.message);
    }
}
