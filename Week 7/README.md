# Week7

## Animation

### Overview

화면 상태의 변화를 부드럽게 처리하는 기법.

- ViewModifier의 인자
- Shape
- 화면에 View의 유무

에 대해 화면 상태가 변화한다.

### Implicit vs Explicit

Implicit,
상대적으로 많이 사용하지는 않습니다.
주로 View 중에서도 작은, 이른바 말단에서 쓰이고, 독립적으로 작동하는 View에서 활용됩니다.

Explicit,
애니메이션이 작동하는 주된 원인은 Model의 변화 입니다.
좀 더 일반화하면, 사용자의 상호작용에 대한 응답입니다.
이 경우 일반적으로 View 전체에서 애니메이션이 작동될 것이고, 이럴 때 Explicit을 활용합니다.

### Transitions

Transition는 View들이 어떻게 도착하고 출발하는 지에 대해 다룹니다.
이른바 CTAAOS 안에 있는 View들에서만 작동합니다.
**C**ontainers **T**hat **A**re **A**lready **O**n-**S**creen, **컨테이너가 화면에 이미 있는 경우.**

Transition은 사실 **한 쌍의** **ViewModifier입니다**.
하나는 변화를 진행하기 전, 다른 하나는 변화를 진행한 후.
asymmetric(비대칭) transition의 경우를 보면, 
하나는 View가 등장할 때(insertion), 
다른 하나는 View가 사라질 때(removal).
