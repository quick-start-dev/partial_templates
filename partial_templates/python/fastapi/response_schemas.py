# app/api_schemas.py

from pydantic import BaseModel, Field
from typing import Generic, TypeVar, List, Optional


class BaseApiResponse(BaseModel):
    success: bool = Field(True)
    message: str = Field("Operation successful.")
    status_code: int = Field(200)


T = TypeVar("T")


class DataApiResponse(BaseApiResponse, Generic[T]):
    data: Optional[T] = Field(None)


class PaginationMeta(BaseModel):
    total: int = Field(..., ge=0)
    limit: int = Field(..., ge=1)
    offset: int = Field(..., ge=1)


class PaginatedApiResponse(BaseApiResponse, Generic[T]):
    data: List[T] = Field(...)
    pagination: PaginationMeta = Field(...)


class Item(BaseModel):
    id: int = Field(..., example=1)
    name: str = Field(..., example="Example Item")
    value: float = Field(..., example=10.5)
