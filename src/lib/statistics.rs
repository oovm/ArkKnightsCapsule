use histogram::Histogram;
use std::collections::BTreeMap;
use rayon::prelude::*;
use crate::lib::random::*;

pub fn test_sp_single(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| sp_single());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}

pub fn test_sp_double(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| sp_double());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}

pub fn test_sp_finish(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| sp_finish());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}

pub fn test_xd_single(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| xd_single());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}

pub fn test_xd_select(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| xd_select());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}

pub fn test_xd_double(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| xd_double());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}

pub fn test_xd_finish(times: i32) -> BTreeMap<u64, u64> {
    let mut histogram = Histogram::new();
    let mut dict: BTreeMap<u64, u64> = BTreeMap::new();
    let tests = (1..=times).into_par_iter().map(|_| xd_finish());
    let output: Vec<i32> = tests.collect();
    for i in output {
        histogram.increment(i as u64).unwrap_or_default();
    }
    for i in histogram.into_iter() {
        dict.insert(i.id(), i.count());
    }
    return dict;
}