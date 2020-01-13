mod lib;

use lib::{
    sp_double_finish, sp_double_six, sp_single_six, xd_double_finish, xd_double_six, xd_select_six,
    xd_single_six,
};

use rayon::prelude::*;
use std::collections::BTreeMap;
use std::fs::File;
use std::io::prelude::*;
use time::PreciseTime;

const TIMES: i32 = 1000_0000;

fn main() -> std::io::Result<()> {
    let start = PreciseTime::now();
    let mut map: BTreeMap<String, Vec<i32>> = BTreeMap::new();
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| sp_single_six());
    map.insert("normal_six".to_string(), tests.collect());
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| sp_double_six());
    map.insert("normal_double".to_string(), tests.collect());
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| sp_double_finish());
    map.insert("normal_finish".to_string(), tests.collect());
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| xd_single_six());
    map.insert("single_six".to_string(), tests.collect());
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| xd_select_six());
    map.insert("select_six".to_string(), tests.collect());
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| xd_double_six());
    map.insert("double_six".to_string(), tests.collect());
    //
    let tests = (1..=TIMES).into_par_iter().map(|_| xd_double_finish());
    map.insert("double_finish".to_string(), tests.collect());
    //
    let serialized = serde_pickle::to_vec(&map, true).unwrap();
    let mut file = File::create("monte_carlo.pkl")?;
    file.write_all(&serialized)?;
    //
    let end = PreciseTime::now();
    println!("finished in {} seconds", start.to(end));
    Ok(())
}
