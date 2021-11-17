import 'package:flutter/material.dart';
import 'dart:async';
import 'model.dart';

class ViewGame extends StatefulWidget {
  const ViewGame({Key? key}) : super(key: key);

  @override
  _ViewGameState createState() => _ViewGameState();
}

class _ViewGameState extends State<ViewGame> {
  String level = "";
  bool stateEasy = true;
  bool stateMedium = true;
  bool stateHard = true;
  bool stateStart = false;
  bool stateReStart = false;
  int time = 5;
  Timer? timer;

  @override
  void initState() {
    level = "";
    stateEasy = true;
    stateMedium = true;
    stateHard = true;
    stateStart = false;
    stateReStart = false;
    flip = false;
    score = 0;
    previousIndex = 0;
    index = 0;
    getEasyImage();
    getMediumImage();
    getHardImage();
    super.initState();
  }

  void checkEzImage(int num) {
    easy[num] = true;
    if (flip == false) {
      flip = true;
      previousIndex = easyLocation[num];
      index = num;
    } else {
      if (previousIndex == easyLocation[num]) {
        setState(() {
          easy[num] = false;
          easy[index] = false;
          ezImage[num] = check;
          ezImage[index] = check;
          score += 10;
        });
      } else {
        setState(() {
          score -= 5;
          for (int i = 0; i < easy.length; i++) {
            easy[i] = false;
          }
        });
      }
      flip = false;
    }
  }

  void checkMdImage(int num) {
    medium[num] = true;
    if (flip == false) {
      flip = true;
      previousIndex = mediumLocation[num];
      index = num;
    } else {
      if (previousIndex == mediumLocation[num]) {
        setState(() {
          medium[num] = false;
          medium[index] = false;
          mdImage[num] = check;
          mdImage[index] = check;
          score += 10;
        });
      } else {
        setState(() {
          score -= 5;
          for (int i = 0; i < medium.length; i++) {
            medium[i] = false;
          }
        });
      }
      flip = false;
    }
  }

  void checkHdImage(int num) {
    hard[num] = true;
    if (flip == false) {
      flip = true;
      previousIndex = hardLocation[num];
      index = num;
    } else {
      if (previousIndex == hardLocation[num]) {
        setState(() {
          hard[num] = false;
          hard[index] = false;
          hdImage[num] = check;
          hdImage[index] = check;
          score += 10;
        });
      } else {
        setState(() {
          score -= 5;
          for (int i = 0; i < hard.length; i++) {
            hard[i] = false;
          }
        });
      }
      flip = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Level: $level",
                    style: const TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                  Text(
                    time.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                  Text(
                    "Score: $score",
                    style: const TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            child: const Text("Easy"),
                            onPressed: stateEasy
                                ? () {
                                    setState(() {
                                      level = "Easy";
                                      stateEasy = false;
                                      stateMedium = true;
                                      stateHard = true;
                                      stateStart = true;
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            child: const Text("Medium"),
                            onPressed: stateMedium
                                ? () {
                                    setState(() {
                                      level = "Medium";
                                      stateEasy = true;
                                      stateMedium = false;
                                      stateHard = true;
                                      stateStart = true;
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            child: const Text("Hard"),
                            onPressed: stateHard
                                ? () {
                                    setState(() {
                                      level = "Hard";
                                      stateEasy = true;
                                      stateMedium = true;
                                      stateHard = false;
                                      stateStart = true;
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            level == "Easy"
                ? easyButton()
                : level == "Medium"
                    ? mediumButton()
                    : hardButton(),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 30, bottom: 10, top: 15),
                          child: ElevatedButton(
                            child: const Text("Start"),
                            onPressed: stateStart
                                ? () {
                                    setState(() {
                                      stateStart = false;
                                      stateReStart = true;
                                      if (level == "Easy") {
                                        for (int i = 0; i < easy.length; i++) {
                                          easy[i] = true;
                                          getEasyImage();
                                        }
                                      } else if (level == "Medium") {
                                        for (int i = 0;
                                            i < medium.length;
                                            i++) {
                                          medium[i] = true;
                                          getMediumImage();
                                        }
                                      } else if (level == "Hard") {
                                        for (int i = 0; i < hard.length; i++) {
                                          hard[i] = true;
                                          getHardImage();
                                        }
                                      }
                                      timer?.isActive;
                                      timer = Timer.periodic(
                                          const Duration(seconds: 1), (timer) {
                                        setState(() {
                                          if (time > 0) {
                                            time--;
                                          } else {
                                            time = 5;
                                            timer.cancel();
                                            if (level == "Easy") {
                                              for (int i = 0;
                                                  i < easy.length;
                                                  i++) {
                                                easy[i] = false;
                                              }
                                            } else if (level == "Medium") {
                                              for (int i = 0;
                                                  i < medium.length;
                                                  i++) {
                                                medium[i] = false;
                                              }
                                            } else if (level == "Hard") {
                                              for (int i = 0;
                                                  i < hard.length;
                                                  i++) {
                                                hard[i] = false;
                                              }
                                            }
                                          }
                                        });
                                      });
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 30, right: 10, bottom: 10, top: 10),
                          child: ElevatedButton(
                            child: const Text("ReStart"),
                            onPressed: stateReStart
                                ? () {
                                    setState(() {
                                      level = "";
                                      stateEasy = true;
                                      stateMedium = true;
                                      stateHard = true;
                                      stateStart = false;
                                      stateReStart = false;
                                      score = 0;
                                      for (int i = 0; i < easy.length; i++) {
                                        easy[i] = false;
                                        getEasyImage();
                                      }
                                      for (int i = 0; i < medium.length; i++) {
                                        medium[i] = false;
                                        getMediumImage();
                                      }
                                      for (int i = 0; i < hard.length; i++) {
                                        hard[i] = false;
                                        getHardImage();
                                      }
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget easyButton() {
    return Expanded(
      flex: 5,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: easy[i]
                                  ? Image.asset(
                                      listImages[easyAnimals[easyLocation[i]]])
                                  : Image.asset(ezImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkEzImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 4; i < 8; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: easy[i]
                                  ? Image.asset(
                                      listImages[easyAnimals[easyLocation[i]]])
                                  : Image.asset(ezImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkEzImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mediumButton() {
    return Expanded(
      flex: 5,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: medium[i]
                                  ? Image.asset(listImages[
                                      mediumAnimals[mediumLocation[i]]])
                                  : Image.asset(mdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkMdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 4; i < 8; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: medium[i]
                                  ? Image.asset(listImages[
                                      mediumAnimals[mediumLocation[i]]])
                                  : Image.asset(mdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkMdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 8; i < 12; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: medium[i]
                                  ? Image.asset(listImages[
                                      mediumAnimals[mediumLocation[i]]])
                                  : Image.asset(mdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkMdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hardButton() {
    return Expanded(
      flex: 5,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 0; i < 6; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: hard[i]
                                  ? Image.asset(
                                      listImages[hardAnimals[hardLocation[i]]])
                                  : Image.asset(hdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkHdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 6; i < 12; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: hard[i]
                                  ? Image.asset(
                                      listImages[hardAnimals[hardLocation[i]]])
                                  : Image.asset(hdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkHdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 12; i < 18; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: hard[i]
                                  ? Image.asset(
                                      listImages[hardAnimals[hardLocation[i]]])
                                  : Image.asset(hdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkHdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Row(
                  children: [
                    for (int i = 18; i < 24; i++)
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: ElevatedButton(
                              child: hard[i]
                                  ? Image.asset(
                                      listImages[hardAnimals[hardLocation[i]]])
                                  : Image.asset(hdImage[i]),
                              onPressed: () {
                                setState(() {
                                  checkHdImage(i);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
