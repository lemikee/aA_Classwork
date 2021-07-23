def my_reject(arr, &prc)
    rejects = []

    arr.each do |ele|
        rejects.push(ele) if !(prc.call(ele))
    end

    rejects
end

def my_one?(arr, &prc)
    true_eles = []

    arr.each do |ele|
        true_eles.push(ele) if prc.call(ele)
    end

    true_eles.length == 1
end

def hash_select(hash, &prc)
    true_hash = {}

    hash.each do |key, value|
        true_hash[key] = value if prc.call(key, value)
    end

    true_hash
end

def xor_select(arr, prc_1, prc_2)
    true_once = []

    arr.each do |ele|
        if (prc_1.call(ele) == true && prc_2.call(ele) == false) || (prc_1.call(ele)== false && prc_2.call(ele) == true)
            true_once.push(ele)
        end
    end

    true_once
end

def proc_count(value, arr_procs)
    count = 0

    arr_procs.each do |prcs|
        count += 1 if prcs.call(value)
    end

    count
end