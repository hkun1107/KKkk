# 🛒 亚马逊电商评论 AI 自动化分类系统 (RPA + LLM Workflow)

![ShadowBot](https://img.shields.io/badge/RPA-ShadowBot(影刀)-blue)
![Python](https://img.shields.io/badge/Python-3.x-yellow)
![LLM](https://img.shields.io/badge/AI_API-Coze(扣子)-purple)
![JSON](https://img.shields.io/badge/Data-JSON_Serialization-green)

## 📖 项目简介
本项目是一个基于 **影刀 RPA** 与 **Coze (扣子) 大模型工作流** 深度集成的自动化数据清洗与分析系统。
它能够自动读取本地 Excel 中的海量无规则电商买家评论，通过自定义 Python 脚本进行脏数据清洗与 JSON 序列化，调用大模型 API 进行精准的情感与意图分析（如：区分“产品质量问题”与“物流问题”），并将复杂的嵌套 JSON 响应反序列化后，精准回填至 Excel。

本项目彻底替代了传统人工客服逐条审阅差评的繁琐流程，实现了电商售后数据的秒级自动化打标。

## 🎯 核心架构与数据流向
本项目放弃了纯 UI 拖拽的低效做法，采用了**“RPA 编排 + Python 底层处理 + API 强交互”**的工程化架构：

1. **[Data I/O]** 读取本地 Excel 原始评论数据。
2. **[Sanitization]** 使用 Python 的 `.strip()` 处理网页抓取残留的换行符、首尾空格等脏数据。
3. **[Serialization]** 利用 `json.dumps()` 将包含特殊字符（如双引号、回车）的原始文本，安全打包成合法的 JSON 请求体，防止 HTTP 400 格式崩溃。
4. **[API Call]** 通过 POST 请求调用 Coze 工作流 API。
5. **[Deserialization]** （核心难点）利用自定义 Python 模块 (`module1.py`) 处理大模型返回的**双重嵌套 JSON**（Stringified JSON inside Data object），精准提取分类结果。
6. **[Data O/P]** 极速回填至 Excel，完成业务闭环。

## 💡 攻克的核心技术难点 (Technical Highlights)

* **复杂嵌套 JSON 的二次反序列化解析**
  大模型 API 的返回结果通常为了兼容性，会将核心输出转为字符串包裹在外层 JSON 中。本项目在 `module1.py` 中独立封装了 `get_coze_result` 解析模块，通过 `try...except` 容错机制与两次 `json.loads()`，实现了数据的优雅提取，保证了流水线的极高稳定性。
* **高鲁棒性的请求体组装（防逃逸机制）**
  真实业务中的爬虫数据往往包含大量的买家自定义符号（引号、特殊换行）。本项目结合了传统开发中的序列化思维，放弃了易报错的纯文本拼接，强制利用 Python 字典转 JSON 机制，实现了 100% 免疫脏数据注入的 HTTP 请求。

## 📂 目录结构

```text
├── 主流程.flow          # 影刀 RPA 主业务流程配置文件 (可视化逻辑树)
├── module1.py         # 核心 Python 脚本：负责脏数据清洗、JSON 组装与二次反序列化解析
├── data/              # 测试数据目录
│   └── 亚马逊评论分析_sample.xlsx # 脱敏后的测试用例
└── README.md          # 项目说明文档
